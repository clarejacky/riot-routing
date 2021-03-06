<app-main>

  <article>
    <h1>{ title }</h1>
    <p>{ body }</p>
    <ul if={ isFirst }>
      <li each={ data }><a href="/first/{ id }">{ title }</a></li>
    </ul>
  </article>

  <script>
    var self = this
    self.title = 'Now loading...'
    self.body = ''
    self.data = [
      { id: 'apple', title: 'Apple', body: "The world biggest fruit company." },
      { id: 'orange', title: 'Orange', body: "I don't have the word for it..." }
    ]

    var r = riot.route.create()
    r('/',       home       )
    r('femme',   first      )
    r('about', about)
    r('wellbeing',  second  )
    r(           home       ) // `notfound` would be nicer!

    function home() {
      self.update({
        title:  "Clare Jacky",
        body:  "Feminism, Technology, and Body Autonomy",
        isFirst: false
      })
    }
    function first() {
      self.update({
        title: "Fem(me)",
        body: "This is where we talk about feminism",
        isFirst: true
      })
    }
    function firstDetail(id) {
      var selected = self.data.filter(function(d) { return d.id == id })[0] || {}
      self.update({
        title: selected.title,
        body: selected.body,
        isFirst: false
      })
    }
    function second() {
      self.update({
        title: "Second feature of your app",
        body: "It could be a config page for example.",
        isFirst: false
      })
    }
  </script>

  <style scoped>
    :scope {
      display: block;
      font-family: sans-serif;
      margin-right: 0;
      margin-bottom: 130px;
      margin-left: 50px;
      padding: 1em;
      text-align: center;
      color: #666;
    }
    ul {
      padding: 10px;
      list-style: none;
    }
    li {
      display: inline-block;
      margin: 5px;
    }
    a {
      display: block;
      background: #f7f7f7;
      text-decoration: none;
      width: 150px;
      height: 150px;
      line-height: 150px;
      color: inherit;
    }
    a:hover {
      background: #eee;
      color: #000;
    }
    @media (min-width: 480px) {
      :scope {
        margin-right: 200px;
        margin-bottom: 0;
      }
    }
  </style>

</app-main>
