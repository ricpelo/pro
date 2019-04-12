<?php

$j = json_decode($argv[1], true);
// print_r($j);

echo '```{=latex}' . PHP_EOL;
foreach ($j['questions'] as $question) {
    echo '\begin{Exercise}[label={\the\value{Exercise}}]' . PHP_EOL;
    echo $question['q'] . PHP_EOL;
    echo PHP_EOL;
    echo '(Para ver la respuesta pulsa aquí:~\ref{\ExerciseLabel-Answer})' . PHP_EOL;
    echo '\end{Exercise}' . PHP_EOL;
    echo '\begin{Answer}[ref=\ExerciseLabel]' . PHP_EOL;
    echo '\begin{itemize}' . PHP_EOL;
    foreach ($question['a'] as $ans) {
        if ($ans['correct']) {
            echo '\item ' . $ans['option'] . PHP_EOL;
        }
    }
    echo '\end{itemize}';
    echo PHP_EOL;
    echo $question['correct'] . PHP_EOL;
    echo '\end{Answer}' . PHP_EOL;
}
echo '```' . PHP_EOL;
