
Feature I try to upload images
  Scenario: Success upload
    Given I visited "upload"
    When I fill in "name" with "tomohiro"
    And I fill in "password" with "hogehoge"
    And I press "login"
    Then I should see "Please select the upload image."
    When I attach the file at "/Users/tomohiro/Pictures/wallpaper1280x800.png" to "images_path"
    And I press "upload"
    When I follow "download"
    Then I should see "delete"

  Scenario: Delete image
    Given I visited "upload"
    When I fill in "name" with "tomohiro"
    And I fill in "password" with "hogehoge"
    And I press "login"
    Then I should see "Please select the upload image."
    When I attach the file at "/Users/tomohiro/Pictures/wallpaper1280x800.png" to "images_path"
    And I press "upload"
    When I follow "download"
    Then I should see "delete"
    When I follow "delete"
    Then I should not see "delete"
    When I follow "logout"
    Then I should see "login"
    And I should not see "logout"
