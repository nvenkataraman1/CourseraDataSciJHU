## Quiz 2 - Question 1
## Connect to github API and fetch information

library(httr)
library(httpuv)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
github <- oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "f64c3dfe4588d8fde9d9", "5670334de03a4e30732dca1c9048d14c4e221f5d")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(github, myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
content(req)