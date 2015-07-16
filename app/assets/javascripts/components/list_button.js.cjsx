@ListButton = React.createClass

  render: ->
    <div>
      <svg viewBox="0 0 512 512" width="10px" height="10px">
        {
          if this.props.check
            <polygon points="398.218,92.985 199.729,291.475 113.754,205.476 50,269.242 199.733,419.015 462,156.726 "/>
        }

        {
          if this.props.plus

            <polygon points="462,198.615 313.385,198.615 313.385,50 198.615,50 198.615,198.615 50,198.615 50,313.385 198.615,313.385 198.615,462 313.385,462 313.385,313.385 462,313.385 "/>
        }
      </svg>
    </div>