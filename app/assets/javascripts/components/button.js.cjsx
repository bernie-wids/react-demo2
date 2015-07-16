@Button = React.createClass
	getInitialState: ->
		added: false
		loading: false

	text: ->
		t = 'My list'

		if this.state.loading
			if this.state.added
				t = 'Removing'
			else
				t = 'Adding'
		t

	onSubmit: (event) ->
		POST event, this.updateData, this

	updateData: (data) ->
		this.setState
			added: data.added

	csrf: ->
		document.querySelector('meta[name="csrf-token"]').getAttribute('content')
		
	render: ->
		<form onSubmit={ this.onSubmit } action="/welcome/add">
			<input type="hidden" name="status" value={ this.state.added } />
			<input type="hidden" name="authenticity_token" value={ this.csrf() } />
			<button type="submit">
				{
					if this.state.added
						<ListButton check />
					else
						<ListButton plus />
				}
				{ this.text() }
			</button>
		</form>