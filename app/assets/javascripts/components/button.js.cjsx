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
			'fa-stack': true
			'fa-lg': true
			'active': this.state.action == 'mouseenter' || this.state.action == 'adding' || this.state.action == 'added'

	render: ->
		text = this.props.text

		if this.state.action == 'adding' || this.state.action == 'removing'
			text = this.state.action + ' ...'

		<button onClick={ this.onClick } onMouseEnter={ this.onMouseEnter } onMouseLeave={ this.onMouseLeave }>
			<span className={ this.classes() }>
				{
					if this.state.action == 'default' || this.state.action == 'mouseleave'
						<div>
							<i className="fa fa-circle-o fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
					else if this.state.action == 'mouseenter' || this.state.action == 'adding'
						<div>
							<i className="fa fa-circle fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>
						</div>
					else if this.state.action == 'added'
						<div>
							<i className="fa fa-circle fa-stack-2x"></i>
							<i className="fa fa-check fa-stack-1x"></i>		
						</div>
				}
			</span>
			{ text }
		</button>