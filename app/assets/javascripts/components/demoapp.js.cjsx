@DemoApp = React.createClass

	onClick: ->
		alert "You clicked the DemoApp.onClick handler"


	render: ->
		<Button onClick={ this.onClick } text="Super Button" />