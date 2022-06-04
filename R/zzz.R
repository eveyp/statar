stata = NULL

.onLoad = function(libname, pkgname) {
  stata <<- import_stata(stata_path(), stata_edition(), delay_load = TRUE)
}
