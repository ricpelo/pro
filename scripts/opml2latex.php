#!/usr/bin/env php
<?php

function spc($nivel)
{
    return str_repeat('    ', $nivel);
}

function trad(SimpleXMLElement $elem, $nivel = 0)
{
    $ret = '';

    if ($elem->attributes()) {
        $ret = spc($nivel) . '\item ' . (string) $elem->attributes()->text . PHP_EOL;
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
