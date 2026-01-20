function combinePathsUri(...fragments) {
  return `/${
    fragments.join("/")}`
    .replace(/\s/g, "")
    .replace(/(\/|\\)+/g, "/")
    .replace(/(.)\/$/, "$1")
}
