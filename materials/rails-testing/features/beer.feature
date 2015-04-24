Feature: Beer list
    @javascript
    Scenario: Open beer list
        Given I bought 2 Light beers
        When Open Home page
        Then I should see 2 beers in list
