import_stata = function(path, edition, splash = TRUE, ...) {
  sys = reticulate::import("sys")

  executable_orig = sys$executable

  sys$executable = reticulate::py_exe()

  pystata = reticulate::import_from_path("pystata", path = path, ...)

  pystata$config$init(edition, splash = splash)

  pystata$stata
}
