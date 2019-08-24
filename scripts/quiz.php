#!/usr/bin/env php
<?php

$j = json_decode($argv[2], true);

if ($argv[1] == 'html') {
    echo '```{=html}' . PHP_EOL;
    echo '<script data-quiz>' . PHP_EOL;
    foreach ($j['questions'] as &$question) {
        $question['correct'] = '<p><span>¡Eso es!</span>' . $question['correct'] . '</p>';
        $question['incorrect'] = '<p><span>Mmmm... no.</span>' . $question['incorrect'] . '</p>';
    }
    echo 'quiz = ' . json_encode($j, JSON_UNESCAPED_SLASHES);
    echo '</script>' . PHP_EOL;
    echo '```' . PHP_EOL;
} elseif ($argv[1] == 'latex') {
    echo '```{=latex}' . PHP_EOL;
    foreach ($j['questions'] as $question) {
        echo '\begin{Exercise}[label={\the\value{Exercise}}]' . PHP_EOL;
        echo $question['q'] . PHP_EOL;
        echo PHP_EOL;
        echo '(Para ver la respuesta pulsa aquí:~\ref{\ExerciseLabel-Answer})' . PHP_EOL;
        echo '\end{Exercise}' . PHP_EOL;
        echo '\begin{Answer}[ref=\ExerciseLabel]' . PHP_EOL;
        echo '\begin{turn}{180}' . PHP_EOL;
        echo '\begin{minipage}[t]{\linewidth}' . PHP_EOL;
        echo '\begin{itemize}[leftmargin=*]' . PHP_EOL;
        foreach ($question['a'] as $ans) {
            if ($ans['correct']) {
                echo '\item ' . $ans['option'] . PHP_EOL;
            }
        }
        echo '\end{itemize}';
        echo PHP_EOL;
        echo $question['correct'] . PHP_EOL;
        echo '\end{minipage}' . PHP_EOL;
        echo '\end{turn}' . PHP_EOL;
        echo '\end{Answer}' . PHP_EOL;
    }
    echo '```' . PHP_EOL;
} else { // $argv[1] == 'beamer'
    echo '```{=latex}' . PHP_EOL;
    foreach ($j['questions'] as $question) {
        echo '\begin{Exercise}[label={\the\value{Exercise}}]' . PHP_EOL;
        echo $question['q'] . PHP_EOL;
        echo PHP_EOL;
        echo '(Para ver la respuesta pulsa aquí:~\ref{\ExerciseLabel-Answer})' . PHP_EOL;
        echo '\end{Exercise}' . PHP_EOL;
        echo '\begin{Answer}[ref=\ExerciseLabel]' . PHP_EOL;
        foreach ($question['a'] as $ans) {
            if ($ans['correct']) {
                echo $ans['option'] . '\par' . PHP_EOL;
            }
        }
        echo PHP_EOL;
        echo $question['correct'] . PHP_EOL;
        echo '\framebreak'. PHP_EOL;
        echo '\end{Answer}' . PHP_EOL;
    }
    echo '```' . PHP_EOL;
}
