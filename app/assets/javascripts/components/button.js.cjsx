@Button = React.createClass

	getInitialState: ->
		action: 'default'
		loading: false

	onMouseEnter: ->
		if this.state.action != 'adding' && this.state.action != 'added'
			this.setState
				action: 'mouseenter'

	onMouseLeave: ->
		if this.state.action != 'adding' && this.state.action != 'added'
			this.setState
				action: 'mouseleave'

	onClick: ->
		action = 'adding'
		path = '/welcome/add.json'

		if this.state.action == 'added'
			action = 'removing'
			path = '/welcome/remove.json'

		this.setState
			action: action
		FETCH path, @updateData
			
	updateData: (data) ->
		action = 'added'

		if this.state.action == 'removing'
			action = 'default'

		@_data = data
		this.setState
			action: action

	classes: ->
		classNames
			'active': this.state.action == 'mouseenter' || this.state.action == 'adding' || this.state.action == 'added'

	render: ->
		text = this.props.text

		if this.state.action == 'adding' || this.state.action == 'removing'
			text = this.state.action + ' ...'

		<button onClick={ this.onClick } onMouseEnter={ this.onMouseEnter } onMouseLeave={ this.onMouseLeave }>
			<span className={ this.classes() }>
				{
					if this.state.action == 'default' || this.state.action == 'mouseleave'
						<PlusButton />
					else if this.state.action == 'mouseenter' || this.state.action == 'adding'
						<PlusButton />
					else if this.state.action == 'added'
						<CheckButton />
				}
			</span>
			{ text }
		</button>