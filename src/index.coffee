ClicksCounter = React.createClass
    render: ->
        React.DOM.div null,
            React.DOM.p style: {color: 'red'}, 
                "Total clicks: " + @props.count

CommentsList = React.createClass
    getInitialState: ->
        comments: @props.comments
    getDefaultProps: -> 
        comments: []
    countClicks: ->
        count = 0
        for comment in @state.comments
            count += comment.clicks
        count
    addClick: (key) ->
        console.log key
        comments = @state.comments.slice()
        for comment in comments
            comment.clicks++ if comment.key == key
        @setState comments: comments
    render: ->
        React.DOM.div null,
            React.DOM.div null,
                for comment in @state.comments
                    React.createElement Comment, comment: comment, handleNewClick: @addClick
            React.DOM.div null,
                React.createElement ClicksCounter, count: @countClicks()
            
Comment = React.createClass
    getInitialState: ->
        clicks: @props.comment.clicks
    handleClick: ->
        @setState clicks: @state.clicks + 1
        @props.handleNewClick(@props.comment.key)
    render: ->
        React.DOM.div null,
            React.DOM.p null,
                @props.comment.message
            React.DOM.p null,
                @props.comment.user
            React.DOM.p onClick: @handleClick,
                "Clicks: " + @state.clicks

comments = [
    {user: "me"
    message: "1st message"
    clicks: 1
    key:1}
    
    {user: "you"
    message: "2nd message"
    clicks: 1
    key:2}
    
    {user: "someone"
    message: "3rd message"
    clicks: 3
    key:3}
]
                
ReactDOM.render React.createElement(CommentsList, comments: comments), document.getElementById('example')