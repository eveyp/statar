stata = NULL

.onLoad = function(libname, pkgname) {
  stata <<- import_stata(stata_path(), "mp", delay_load = TRUE)
}
