console.log('read')

import React from 'react';

window.Test = React.createClass({
    render: function() {
        return <h1>{this.props.title}</h1>
    }
})