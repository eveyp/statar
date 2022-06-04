stata_path = function() {
  path = getOption("statar.stata.path", Sys.getenv("STATAR_STATA_PATH"))

  return(path)
}
