<app-navi>

  <a each={ links } href="/{ url }" class={ selected: parent.selectedId === url }>
    { name }
  </a>

  <script>
    var self = this

    this.links = [
      { name: "H", url: "" },
      { name: "F", url: "femme" },
      { name: "W", url: "wellbeing" },
      { name: "A", url: "about" }
    ]

    var r = riot.route.create()
    r(highlightCurrent)

    var plunkrRandomUrl = location.pathname.replace(new RegExp('/', 'g'), '')

    function highlightCurrent(id) {
      // Plunker confuses routing initially
      if ( plunkrRandomUrl == id ) { id = '' }

      self.selectedId = id
      self.update()
    }
  </script>

  <style scoped>
    :scope {
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      box-sizing: border-box;
      font-family: sans-serif;
      text-align: center;
      color: #F5F5F5;
      background: white;
      width: 50px;
      transition: width .2s;
    }
    :scope:hover {
      width: 60px;
    }
    a {
      display: block;
      box-sizing: border-box;
      width: 100%;
      height: 50px;
      line-height: 50px;
      padding: 0 .8em;
      color: #7F7F7F;
      text-decoration: none;
      background: #F5F5F5;
    }
    a:hover {
      background: white;
    }
    a.selected {
      background: #F5F5F5;
    }
  </style>

</app-navi>
