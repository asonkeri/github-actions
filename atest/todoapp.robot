*** Settings ***
Library    Browser

*** Variables ***
${SUT URL}    https://todomvc.com/examples/vanillajs/

*** Test Cases ***
Should add TODOs
    Given There Are No TODOs
    When "Buy Milk" TODO Is Created
    Then "Buy Milk" TODO Should Be In TODO List

Should Wait A Long Time
    Sleep    3min

*** Keywords ***
There Are No TODOs
    New Page   ${SUT URL}

"${todo}" TODO Is Created
    Type Text    .new-todo    ${todo}
    Keyboard Key    press    Enter

"${todo}" TODO Should Be In TODO List
    Wait For Elements State    css=.todo-list >> text="Buy Milk"    visible

