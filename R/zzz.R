.onLoad <- function(libname = find.package("superNetballR"),
                    pkgname = "superNetballR"){
    
    ## quiets concerns of R CMD check re the variables in data frames
    if(getRversion() >= "2.15.1") utils::globalVariables(
        c("squadId", "homeTeam", "period", "stat", "value", "squadName",
          "squadNickname", "squadCode", "round", "game", "displayName",
          "playerId", "shortDisplayName", "firstname", "surname", "goals",
          "score_diff", "points", "goals_for", "goals_against", "percentage",
          "n", "data")
        )
    
    invisible()
}

.unUnload <- function(libpath) {
    library.dynam.unload("superNetballR", libpath)
}
