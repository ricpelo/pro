#!/usr/bin/env php
<?php

class Esquema
{
    const DEFAULT_ENV = 'longenum';
    const MAX_NIVEL = 99;

    public $env = self::DEFAULT_ENV;
    public $maxNivel = self::MAX_NIVEL;
    public $content;
    public $title;

    public function __construct($env = self::DEFAULT_ENV, $maxNivel = self::MAX_NIVEL)
    {
        $this->env = $env;
        $this->maxNivel = $maxNivel;
    }

    protected function spc($nivel)
    {
        return str_repeat('    ', $nivel);
    }

    protected function filtrarEspeciales($text)
    {
        $text = preg_replace('/{/', '\\{', $text);
        $text = preg_replace('/}/', '\\}', $text);
        $text = preg_replace('/_/', '\\_', $text);
        $text = preg_replace('/#/', '\\#', $text);
        $text = preg_replace('/&/', '\\&', $text);
        $text = preg_replace('/\^/', '\\\^', $text);
        $text = preg_replace('/\$/', '\\\$', $text);
        return $text;
    }

    protected function filtrarEnlaces($text)
    {
        // [link: Cadenas (\texttt{string})|http://php.net/manual/es/language.types.string.php]
        $text = preg_replace('/\[link: (.*)\|.*\]/', '$1', $text);
        // [Funciones de manejo de cadenas](http://php.net/ref.strings)
        $text = preg_replace('/\[(.*)\]\(.*\)/', '$1', $text);
        return $text;
    }

    protected function filtrarEstilos($text)
    {
        $text = preg_replace('/\*\*(.*)\*\*/U', '\textbf{$1}', $text);
        $text = preg_replace('/\*(.*)\*/U', '\textit{$1}', $text);
        $text = preg_replace('/`(.*)`/U', '\texttt{$1}', $text);
        return $text;
    }

    protected function filtrar($text)
    {
        $text = $this->filtrarEspeciales($text);
        $text = $this->filtrarEnlaces($text);
        $text = $this->filtrarEstilos($text);
        return $text;
    }

    protected function beginEnv()
    {
        return '\begin{' . $this->env . '}' . PHP_EOL;
    }

    protected function endEnv()
    {
        return '\end{' . $this->env . '}' . PHP_EOL;
    }

    protected function ev($tags)
    {
        $matches = [];
        if (preg_match('/ev\d+/', $tags, $matches)) {
            return $matches[0];
        }
        return '';
    }

    protected function filtrarEtiqueta($tag)
    {
        return preg_replace('/ce(.*)/', 'ce{$1}', $tag);
    }

    protected function trad(SimpleXMLElement $elem, $nivel = 0)
    {
        $ret = '';

        if ($nivel != 0 && $attr = $elem->attributes()) {
            $text = (string) $attr->text;
            $text = $this->filtrar($text);

            $ret = $this->spc($nivel) . '\item ' . $text;

            if ($attr->tags) {
                $ret .= ' ' . implode(' ', array_map(function ($t) { return '\\' . $this->filtrarEtiqueta($t) . '\\'; }, explode(',', $attr->tags)));
            }

            if ($attr->due) {
                $ret .= ' (Est: ' . $attr->due . ')';
            }

            $ret .= PHP_EOL;
        }

        if (count($elem->outline) > 0 && $nivel < $this->maxNivel) {
            $ret .= $this->spc($nivel) . $this->beginEnv();

            foreach ($elem->outline as $item) {
                if ($item->attributes()->text != '---') {
                    $ret .= $this->trad($item, $nivel + 1);
                }
            }

            $ret .= $this->spc($nivel) . $this->endEnv();
        }

        return $ret;
    }

    protected function cargaContenido($url)
    {
        $this->content = file_get_contents($url);
        $this->content = simplexml_load_string($this->content);
        $this->title = (string) $this->content->head->title;
        $this->content = $this->content->body;
    }

    public function run($url)
    {
        $this->cargaContenido($url);
        return $this->trad($this->content->outline, 0);
    }
}

class Resumen extends Esquema
{
    const DEFAULT_ENV = 'longtable';

    public function __construct($maxNivel = self::MAX_NIVEL)
    {
        parent::__construct(self::DEFAULT_ENV, $maxNivel);
    }

    protected function filtrar($text)
    {
        $text = parent::filtrar($text);
        $text = preg_replace('/\\\textbf{(.*)}/', '$1', $text);
        return $text;
    }

    protected function ev($tags)
    {
        $matches = [];
        if (preg_match('/ev\d/', $tags, $matches)) {
            return $matches[0];
        }
        return '';
    }

    protected function trad(SimpleXMLElement $elem, $nivel = 0)
    {
        $ud = 1;
        $ret = '';

        foreach ($elem->outline as $item) {
            $attr = $item->attributes();
            $text = (string) $attr->text;
            if ($text != '---') {
                $text = $this->filtrar($text);
                $ret .= $ud++ . '. ' . $text;
                $ret .= ' \\' . $this->ev($attr->tags) . ' & ';
                $ret .= $attr->due . ' \tabularnewline' . PHP_EOL;
                $ret .= '\hline' . PHP_EOL;
            }
        }

        return $ret;
    }

    public function run($url)
    {
        $this->cargaContenido($url);
        $ret  = '\begin{center}' . PHP_EOL;
        $ret .= '\small' . PHP_EOL;
        $ret .= '\begin{' . $this->env . '}{|l|c|}' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\textbf{Unidad didáctica} & \textbf{Inicio estimado}\tabularnewline' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\endhead' . PHP_EOL;
        $ret .= $this->trad($this->content->outline, 0);
        $ret .= '\end{' . $this->env . '}' . PHP_EOL;
        $ret .= '\par\end{center}' . PHP_EOL;
        return $ret;
    }
}

class RaCe extends Resumen
{
    const MAX_RA = 9;

    protected function generaRaCe($tags)
    {
        $ret = [];
        $ras = [];
        if (preg_match_all('/ra\d+/', $tags, $ras)) {
            foreach ($ras[0] as $ra) {
                $match = [];
                if (preg_match('/ra(\d+)/', $ra, $match)) {
                    $raNum = $match[1];
                    $match = [];
                    $ra = mb_strtoupper($ra);
                    $ret[$ra] = [];
                    if (preg_match_all('/ce' . $raNum . '[^,]*/', $tags, $match)) {
                        $ret[$ra] = $match[0];
                    }
                }
            }
        }
        return $ret;
    }

    protected function trad(SimpleXMLElement $elem, $nivel = 0)
    {
        $ud = 1;
        $ret = '';

        foreach ($elem->outline as $item) {
            $attr = $item->attributes();
            $text = (string) $attr->text;
            if ($text != '---') {
                $text = $this->filtrar($text);
                $ret .= $ud++ . '. ' . $text;
                $race = $this->generaRaCe($attr->tags);

                for ($i = 1; $i <= self::MAX_RA; $i++) {
                    $ret .= ' & ';
                    if (isset($race["RA$i"])) {
                        $ra = $race["RA$i"];
                        if (empty($ra)) {
                            $ret .= '$\times$';
                        } else {
                            $ra = array_map(function ($x) { return '\\' . $this->filtrarEtiqueta($x); }, $ra);
                            $ret .= implode(' ', $ra);
                        }
                    }
                }

                $ret .= ' \tabularnewline' . PHP_EOL;
                $ret .= '\hline' . PHP_EOL;
            }
        }

        return $ret;
    }

    public function run($url)
    {
        $this->cargaContenido($url);
        $ret  = '\begin{center}' . PHP_EOL;
        $ret .= '\footnotesize' . PHP_EOL;
        $ret .= '\begin{' . $this->env . '}[c]{|>{\raggedright}m{4cm}';
        for ($i = 1; $i <= self::MAX_RA; $i++) {
            $ret .= '|>{\centering}m{0.7cm}';
        }
        $ret .= '|}' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\textbf{Unidades didácticas}';
        for ($i = 1; $i <= self::MAX_RA; $i++) {
            $ret .= ' & \ra' . $i;
        }
        $ret .= '\tabularnewline' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\hline' . PHP_EOL;
        $ret .= '\endhead' . PHP_EOL;
        $ret .= $this->trad($this->content->outline, 0);
        $ret .= '\end{' . $this->env . '}' . PHP_EOL;
        $ret .= '\par\end{center}' . PHP_EOL;
        return $ret;
    }
}

$options = getopt('u:e::n::');

$url = $options['u'];
$maxNivel = (int) ($options['n'] ?? Esquema::MAX_NIVEL);
$env = $options['e'] ?? Esquema::DEFAULT_ENV;

switch ($env) {
    case 'resumen':
        $opml = new Resumen($maxNivel);
        break;
    case 'race':
        $opml = new RaCe($maxNivel);
        break;
    default:
        $opml = new Esquema($env, $maxNivel);
        break;
}

echo $opml->run($url);
