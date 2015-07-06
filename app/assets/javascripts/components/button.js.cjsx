@Button = React.createClass

	getInitialState: ->
		{ action: 'default' }

	classes: ->
		classNames
			'fa-stack': true
			'fa-lg': true


	render: ->
		<button onClick={ this.props.onClick }>
			<span className={ this.classes() }>
				<i className="fa fa-circle fa-stack-2x"></i>
				<i className="fa fa-plus fa-stack-1x"></i>
			</span>
			{ this.props.text }
		</button>