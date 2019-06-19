window.addEventListener('load', function() {
  const flags = {
    width: window.innerWidth,
    height: window.innerHeight
  }

  const app = Elm.Main.init({ flags: flags })
})
