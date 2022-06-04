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
