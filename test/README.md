# Note Commerce tests

## Selenium IDE
The `Note Commerce.side` file contains a Selenium IDE (browser extension ver.) file. It contains all the black box / GUI tests.

### Opening and running tests
1. Install the [Selenium IDE](https://www.selenium.dev/selenium-ide/) extension on your browser
2. Open it with the new icon on the top-right corner of the browser
3. Choose to "Open an existing project" and choose the `Note Commerce.side` file
4. Press `Ctrl+2` or select "Test Suits" on the top-left dropdown menu
5. Choose the first test of the test suit you want to run, and click on the "Run all tests" (`Ctrl+Shift+R`) button,
in the top-middle of the window

Make sure the project is running at localhost on port 8080 and the context is `note-commerce`, 
as the URLs opened by the tests are hardcoded to http://localhost:8080/note-commerce/...

If you want to run tests individually (not following the test suit sequence), 
make sure that you're already in a state that tests requires (already logged in, for example).
