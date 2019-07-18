#!/usr/bin/env php
<?php

function spc($nivel)
{
    return str_repeat('    ', $nivel);
}

function trad(SimpleXMLElement $elem, $nivel = 0)
{
    $ret = '';

    if ($elem->attributes() && $nivel != 0) {
        $text = (string) $elem->attributes()->text;
        $text = preg_replace('/{/', '\\{', $text);
        $text = preg_replace('/}/', '\\}', $text);
        $text = preg_replace('/_/', '\\_', $text);
        $text = preg_replace('/#/', '\\#', $text);
        $text = preg_replace('/&/', '\\&', $text);
        $text = preg_replace('/\^/', '\\\^', $text);
        $text = preg_replace('/\$/', '\\\$', $text);
        $text = preg_replace('/\*\*(.*)\*\*/U', '\\textbf{$1}', $text);
        $text = preg_replace('/\*(.*)\*/U', '\\textit{$1}', $text);
        $text = preg_replace('/`(.*)`/U', '\\texttt{$1}', $text);
        // [link: Cadenas (\texttt{string})|http://php.net/manual/es/language.types.string.php]
        $text = preg_replace('/\[link: (.*)\|.*\]/', '$1', $text);
        // [Funciones de manejo de cadenas](http://php.net/ref.strings)
        $text = preg_replace('/\[(.*)\]\(.*\)/', '$1', $text);
        $ret = spc($nivel) . '\item ' . $text . PHP_EOL;
    }

    if (count($elem->outline) > 0) {
        $ret .= spc($nivel) . '\begin{longenum}' . PHP_EOL;
        foreach ($elem->outline as $item) {
            $ret .= trad($item, $nivel + 1);
        }
        $ret .= spc($nivel) . '\end{longenum}' . PHP_EOL;
    }

    return $ret;
}

function parseOutliner($url) {
    $content = file_get_contents($url);
    $content = simplexml_load_string($content);
    $title = (string) $content->head->title;
    $content = $content->body;

    return trad($content->outline, 0);
}

echo parseOutliner($argv[1]);
