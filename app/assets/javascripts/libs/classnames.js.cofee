###!
  Copyright (c) 2015 Jed Watson.
  Licensed under the MIT License (MIT), see
  http://jedwatson.github.io/classnames
###

do ->
	
	classNames = ->

		classes = ''
		i = 0

		while i < arguments.length

			arg = arguments[i]

			if !arg
				i++
				continue

			argType = typeof arg

			if 'string' == argType or 'number' == argType
				classes += ' ' + arg
			else if Array.isArray(arg)
				classes += ' ' + classNames.apply(null, arg)
			else if 'object' == argType
				for key of arg
					if arg.hasOwnProperty(key) and arg[key]
						classes += ' ' + key

			i++

		classes.substr 1

	window.classNames = classNames
