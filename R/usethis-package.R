#' @keywords internal
"_PACKAGE"

.onLoad <- function(libname, pkgname) {
  backports::import(pkgname, "dir.exists")

  if("devtools::test" %in% sys.calls()[1]) {
    ns <- asNamespace(pkgname)
    impenv <- parent.env(ns)
    pkgload:::unlock_environment(impenv)
    pkgload:::insert_imports_shims(pkgname)
  }
}
