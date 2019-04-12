!define(MSG)
~~~~~~~~~~~~~~~~~~~~~~~
{
        "info": {
                "name":    "",
                "main":    ""
        },
        "questions": [
                {
                        "q": "What number is the letter A in the English alphabet?",
                        "a": [
                                {"option": "8",      "correct": false},
                                {"option": "14",     "correct": false},
                                {"option": "1",      "correct": true},
                                {"option": "23",     "correct": false}
                        ],
                        "correct": "<p><span>That's right!</span> The letter A is the first letter in the alphabet!</p>",
                        "incorrect": "<p><span>Uhh no.</span> It's the first letter of the alphabet. Did you actually <em>go</em> to kindergarden?</p>"
                }
        ]
}
~~~~~~~~~~~~~~~~~~~~~~~

!define(PY)
~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~
x = """!MSG"""
print(x.replace('"', '\\"'))
~~~~~~~~~~
~~~~~~~~~~~~~~~~

!sh(/usr/bin/php p.php "!PY")
