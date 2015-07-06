@Button = React.createClass

	getInitialState: ->
		action: 'default'

	onMouseEnter: ->
		this.setState
			action: 'mouseenter'

	onMouseLeave: ->
		this.setState
			action: 'mouseleave'

	render: ->
		<button onClick={ this.props.onClick } onMouseEnter={ this.onMouseEnter } onMouseLeave={ this.onMouseLeave } className={ this.state.action }>
			<span className="fa-stack fa-lg">
				{
					if this.state.action == 'default' || this.state.action == 'mouseleave'
						<div>
							<i className="fa fa-circle-o fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
					else if this.state.action == 'mouseenter'
						<div>
							<i className="fa fa-circle fa-stack-2x"></i>
							<i className="fa fa-plus fa-stack-1x"></i>		
						</div>
				}
			</span>
			{ this.props.text }
		</button>