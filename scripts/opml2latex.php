#!/usr/bin/env php
<?php

const MAX_NIVEL = 99;
const DEFAULT_ENV = 'longenum';

function spc($nivel)
{
    return str_repeat('    ', $nivel);
}

function trad(SimpleXMLElement $elem, $nivel = 0, $maxNivel = MAX_NIVEL, $env = DEFAULT_ENV, $ud = 1)
{
    $ret = '';

    if ($nivel != 0 && $attr = $elem->attributes()) {
        $text = (string) $attr->text;
        $text = preg_replace('/{/', '\\{', $text);
        $text = preg_replace('/}/', '\\}', $text);
        $text = preg_replace('/_/', '\\_', $text);
        $text = preg_replace('/#/', '\\#', $text);
        $text = preg_replace('/&/', '\\&', $text);
        $text = preg_replace('/\^/', '\\\^', $text);
        $text = preg_replace('/\$/', '\\\$', $text);
        if ($env !== 'longtable') {
            $text = preg_replace('/\*\*(.*)\*\*/U', '\textbf{$1}', $text);
        } else {
            $text = preg_replace('/\*\*(.*)\*\*/U', '$1', $text);
        }
        $text = preg_replace('/\*(.*)\*/U', '\textit{$1}', $text);
        $text = preg_replace('/`(.*)`/U', '\texttt{$1}', $text);
        // [link: Cadenas (\texttt{string})|http://php.net/manual/es/language.types.string.php]
        $text = preg_replace('/\[link: (.*)\|.*\]/', '$1', $text);
        // [Funciones de manejo de cadenas](http://php.net/ref.strings)
        $text = preg_replace('/\[(.*)\]\(.*\)/', '$1', $text);

        if ($nivel === $maxNivel && $env === 'longtable') {
            return (($env === 'longtable') ? $ud . '. ' : '') . $text . ' \\' . $attr->tags . ' & ' . $attr->due . '\tabularnewline' . PHP_EOL . '\hline' . PHP_EOL;
        }

        $ret = spc($nivel) . '\item ' . $text;

        if ($attr->tags) {
            $ret .= ' \\' . $attr->tags;
        }

        if ($attr->due) {
            $ret .= ' (Est: ' . $attr->due . ')';
        }

        $ret .= PHP_EOL;
    }

    if (count($elem->outline) > 0 && $nivel < $maxNivel) {

        if ($env !== 'longtable') {
            $ret .= spc($nivel) . '\begin{' . $env . '}' . PHP_EOL;
        }

        foreach ($elem->outline as $item) {
            if ($item->attributes()->text != '---') {
                $ret .= trad($item, $nivel + 1, $maxNivel, $env, $ud++);
            }
        }

        if ($env !== 'longtable') {
            $ret .= spc($nivel) . '\end{' . $env . '}' . PHP_EOL;
        }
    }

    return $ret;
}

$url = $argv[1];
$maxNivel = isset($argv[2]) ? (int) $argv[2] : MAX_NIVEL;
$env = isset($argv[3]) ? $argv[3] : DEFAULT_ENV;

$content = file_get_contents($url);
$content = simplexml_load_string($content);
$title = (string) $content->head->title;
$content = $content->body;

if ($env === 'longtable') {
    echo '\begin{center}' . PHP_EOL;
    echo '\small' . PHP_EOL;
    echo '\begin{longtable}{|l|c|}' . PHP_EOL;
    echo '\hline' . PHP_EOL;
    echo '\textbf{Unidad didáctica} & \textbf{Inicio estimado}\tabularnewline' . PHP_EOL;
    echo '\hline' . PHP_EOL;
    echo '\hline' . PHP_EOL;
    echo '\endhead' . PHP_EOL;
}

echo trad($content->outline, 0, $maxNivel, $env);

if ($env === 'longtable') {
    echo '\end{longtable}' . PHP_EOL;
    echo '\par\end{center}' . PHP_EOL;
}
