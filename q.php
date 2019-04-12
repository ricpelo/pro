<?php

//$f = file_get_contents('juan');

$j = json_decode($argv[1], true);
// print_r($j);

echo '```{=html}' . PHP_EOL;
echo '<script data-quiz>' . PHP_EOL;
foreach ($j['questions'] as &$question) {
    $question['correct'] = '<p><span>¡Eso es!</span>' . $question['correct'] . '</p>';
    $question['incorrect'] = '<p><span>Mmmm... no.</span>' . $question['incorrect'] . '</p>';
}
echo 'quiz = ' . json_encode($j, JSON_UNESCAPED_SLASHES);
echo '</script>' . PHP_EOL;
echo '```' . PHP_EOL;
