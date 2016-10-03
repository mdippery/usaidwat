Feature: Show timeline of comments

  As a Redditor
  I want to visualize when another Redditor comments most often
  In order to see what time they like to comment

  Scenario: Show timeline data for user
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat timeline mipadi`
    Then it should pass with:
      """
        0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
      S                 *           *                 *                        
      M                          *  *  *     *  *  *  *     *     *            
      T                       *  *  *  *  *  *  *  *     *                     
      W                          *  *  *  *  *     *                           
      T                          *  *  *     *  *  *                 *  *      
      F                          *  *  *                 *        *  *  *      
      S                                      *  *                              
      """

  Scenario: Show timeline data for a user with no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat timeline blank`
    Then it should pass with:
      """
      blank has no comments.
      """

  Scenario: Show timeline data without specifying a user
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat timeline testuser`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      No such user: testuser
      """

  Scenario: Show timeline without specifying a user
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat timeline`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You must specify a username
      """
