stata_path = function() {
  path = getOption("statar.stata.path", Sys.getenv("STATAR_STATA_PATH"))

  check_stata_path(path, rlang::caller_env())

  return(path)
}

check_stata_path = function(path, call = rlang::caller_env()) {
  if (path == "") {
    cli::cli_abort(
      c(
        "Path to Stata installation must be provided.",
        i = "Provide the path in either:",
        i = "R option 'statar.stata.path'",
        i = "environmental variable 'STATAR_STATA_PATH'."
      ),
      call = call
    )
  }

  if (!dir.exists(path)) {
    cli::cli_abort(
      c(
        "Stata installation directory does not exist.",
        x = "You provided {path}"
      ),
      call = call
    )
  }
}

stata_edition = function() {
  edition = getOption("statar.stata.edition", Sys.getenv("STATAR_STATA_EDITION"))

  check_stata_edition(edition)

  return(edition)
}

check_stata_edition = function(edition, call = rlang::caller_env()) {
  if (length(edition) > 1) {
    cli::cli_abort(
      c(
        "Only one Stata edition allowed.",
        # x = "You provided: {glue::glue_collapse(edition, ', ', last = ' & ')}"
        x = "You provided: '{edition}'."
      )
    )
  }

  if (edition == "") {
    cli::cli_abort(
      c(
        "Can't find the Stata edition.",
        i = "Provide the Stata edition in either:",
        i = "R option 'statar.stata.edition'",
        i = "Environmental variable 'STATAR_STATA_EDITION'."
      ),
      call = call
    )
  }

  if (!(edition %in% c("mp", "se", "be"))) {
    cli::cli_abort(
      c(
        "Stata edition must be one of: 'mp', 'se', or 'be'.",
        x = "You provided '{edition}'."
      ),
      call = call
    )
  }
}
