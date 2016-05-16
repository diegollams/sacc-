var CustomerShow = React.createClass({
    getInitialState: function () {
        return {editing: false,customer: this.props.customer}
    },
    toggleEditing: function () {
        this.setState({editing: !this.state.editing});
    },
    handleUpdate: function (customer) {
        this.setState({customer: customer,editing: false});
    },
    render: function () {
        var body = null,footer = null;
        if(this.state.editing){
            body = <CustomerForm customer={this.state.customer} handleCancel={this.toggleEditing} handleUpdate={this.handleUpdate}/>;
        }else{
            body = <CustomerInfo customer={this.state.customer} editClick={this.toggleEditing}/>;
        }
        return (
            <div>
                {body}
            </div>
        );
    }
});