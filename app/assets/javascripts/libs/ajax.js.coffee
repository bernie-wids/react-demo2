class window.Ajax

	constructor: (@parent) ->

	delete: (event, onComplete) =>
		@ajax "DELETE", event, onComplete

	patch: (event, onComplete) =>
		@ajax "PATCH", event, onComplete

	post: (event, onComplete) =>
		@ajax "POST", event, onComplete

	ajax: (method, event, onComplete) =>

		event.preventDefault()
		form = event.currentTarget

		@parent.setState
			loading: true

		req = new XMLHttpRequest()

		req.addEventListener 'readystatechange', =>

			if req.readyState is 4 # ReadyState Complete

				if req.status in [200, 304]
					@parent.setState
						loading: false
					onComplete JSON.parse(req.responseText)
				else
					@parent.setState
						loading: false

					formErrors JSON.parse(req.responseText).errors

		req.open method, form.getAttribute('action'), true
		req.setRequestHeader 'Content-type', 'application/json'
		req.setRequestHeader 'Accept', 'application/json'
		# req.setRequestHeader 'X-CSRF-Token', Session.csrf().token
		req.send @serialize(form)

	serialize: (form) ->

		formData: {}

		for i in form.querySelectorAll('input, select, textarea')

			switch i.nodeName

				when 'INPUT'
					if i.type in ['text', 'password', 'hidden'] || i.type in ['checkbox', 'radio'] && i.checked
						formData[i.name] = i.value

				when 'SELECT'

					if i.type == 'select-one'
						formData[i.name] = i.value

					if i.type == 'select-multiple'
						for opt in i.options
							console.log 'NOT IMPLEMENTED'

				when 'TEXTAREA'
					formData[i.name] = i.value

		JSON.stringify(formData)

window.patch = (obj, event, callback) ->
	new Ajax(obj).patch event, callback

window.delete = (obj, event, callback) ->
	new Ajax(obj).delete event, callback