@Button = React.createClass

	getInitialState: ->
		action: 'default'
		loading: false

	onMouseEnter: ->
		this.setState
			action: 'mouseenter'

	onMouseLeave: ->
		this.setState
			action: 'mouseleave'

	onClick: ->
		this.setState
			action: 'click'
		post '/some-url', @updateData

	updateData: (data) ->
		@_data = data

	render: ->
		text = this.props.text

		if this.state.action == 'click'
			text = 'Adding ...'

		<button onClick={ this.onClick } onMouseEnter={ this.onMouseEnter } onMouseLeave={ this.onMouseLeave } className={ this.state.action }>
			<span className="fa-stack fa-lg">
				{
					if this.state.action == 'default' || this.state.action == 'mouseleave'
						<div>
							<i className="fa fa-circle-o fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
					else if this.state.action == 'mouseenter' || this.state.action == 'click'
						<div>
							<i className="fa fa-circle fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
				}
			</span>
			{ text }
		</button>