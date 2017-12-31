

myapp <- httr::oauth_app(appname = "archivist.me",
                         key = "9a406503ff8386f82702",
                         secret = "9616d78b5d61ca9a706bccec7008e6aad9ef4a24")
gh_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp, scope = "public_repo")


usr.name <- "bfatemi"
usr.email <- "bfatemi07@gmail.com"
usr.pwd <- protolite::serialize_pb(rstudioapi::askForPassword("Enter GitHub Password"))


repo <- "archive.plots"
gh_resp <- createGitHubRepo(repo = repo,
                            github_token = gh_token,
                            user = usr.name,
                            repoDir = NULL,
                            password = protolite::unserialize_pb(usr.pwd),
                            repoDescription = aoptions("repoDescription"),
                            readmeDescription = aoptions("readmeDescription"),
                            response = TRUE,
                            default = FALSE,
                            verbose = FALSE)
showRemoteRepo(repo, user = "bfatemi", repoType = "github")


przyklad <- 1:100
md5hash_path <- archive(artifact = przyklad,
                        repo = repo,
                        user = "bfatemi",
                        repoDir = "archive.plots",
                        artifactName = "przyklad",
                        password = protolite::unserialize_pb(usr.pwd))
