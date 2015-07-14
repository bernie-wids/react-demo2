class Ajax

  constructor: (@parent) ->

  delete: (event, onComplete) =>
    @ajaxForm "DELETE", event, onComplete

  patch: (event, onComplete) =>
    @ajaxForm "PATCH", event, onComplete

  post: (event, onComplete) =>
    @ajaxForm "POST", event, onComplete

  postJSON: (data, action, onComplete) =>
    @ajax "POST", JSON.stringify(data), action, onComplete

  get: (action, onComplete) =>
    @ajax("GET", null, action, onComplete)

  ajaxForm: (method, event, onComplete) =>
    event.preventDefault()
    form = event.currentTarget
    data = @serialise(form)
    action = form.getAttribute('action')
    @ajax(method, data, action, onComplete)

  ajax: (method, data, action, onComplete) =>

    if @parent
      @parent.setState
        loading: true

    req = new XMLHttpRequest()

    req.addEventListener 'readystatechange', =>

      if req.readyState is 4 # ReadyState Complete

        if req.status in [200, 304]
          if @parent
            @parent.setState
              loading: false
          onComplete JSON.parse(req.responseText)
        else
          if @parent
            @parent.setState
              loading: false

          FormErrors.setErrors JSON.parse(req.responseText).errors

    req.open method, action, true
    req.setRequestHeader 'Content-Type', 'application/json'
    req.setRequestHeader 'Accept', 'application/json'
    #req.setRequestHeader 'X-CSRF-Token', Session.csrf().token
    req.send(data)

  serialise: (form) ->

    formData = {}

    for i in form.querySelectorAll('input, select, textarea')

      switch i.nodeName

        when "INPUT"
          if i.type in ["text", "password", "hidden"] || i.type in ["checkbox", "radio"] && i.checked
            formData[i.name] = i.value

        when "SELECT"

          if i.type == "select-one"
            formData[i.name] = i.value

          if i.type == "select-multiple"
            for opt in i.options
              alert "WARNING: select-multiple NOT IMPLEMENTED"

        when "TEXTAREA"
          formData[i.name] = i.value

    JSON.stringify(formData)

window.DELETE = (event, onComplete, obj) ->
  new Ajax(obj).delete event, onComplete

window.FETCH = (action, onComplete, obj) ->
  new Ajax(obj).get action, onComplete

window.PATCH = (event, onComplete, obj) ->
  new Ajax(obj).patch event, onComplete

window.POST = (event, onComplete, obj) ->
  new Ajax(obj).post event, onComplete

window.POSTJSON = (data, action, onComplete) ->
  new Ajax(null).postJSON data, action, onComplete