@Button = React.createClass

	getInitialState: ->
		action: 'default'
		loading: false

	onMouseEnter: ->
		if this.state.action != 'adding'
			this.setState
				action: 'mouseenter'

	onMouseLeave: ->
		if this.state.action != 'adding'
			this.setState
				action: 'mouseleave'

	onClick: ->
		this.setState
			action: 'adding'
		FETCH '/welcome/demo.json', @updateData
			
	updateData: (data) ->
		console.log 'updateData'
		console.log data

		@_data = data
		this.setState
			action: 'added'

	classes: ->
		classNames
			'fa-stack': true
			'fa-lg': true

	render: ->
		text = this.props.text

		if this.state.action == 'adding'
			text = 'Adding ...'

		<button onClick={ this.onClick } onMouseEnter={ this.onMouseEnter } onMouseLeave={ this.onMouseLeave } className={ this.state.action }>
			<span className={ this.classes() }>
				{
					if this.state.action == 'default' || this.state.action == 'mouseleave' || this.state.action == 'added'
						<div>
							<i className="fa fa-circle-o fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
					else if this.state.action == 'mouseenter' || this.state.action == 'adding'
						<div>
							<i className="fa fa-circle fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
				}
			</span>
			{ text }
		</button>