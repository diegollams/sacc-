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
        var body = null, footer = null, fieldCount = 0, infoAdded = 0, progress = null;
        if(this.state.editing){
            body = <CustomerForm customer={this.state.customer} handleCancel={this.toggleEditing} handleUpdate={this.handleUpdate}/>;
        }else{
            body = <CustomerInfo customer={this.state.customer} editClick={this.toggleEditing}/>;
        }
        for(info in this.state.customer){
            if(this.state.customer[info]){
                infoAdded++;
            }
            fieldCount++;
        }
        progress = '' + (infoAdded * 100) / fieldCount + '%';

        return (
            <div>
                {body}
                <label>Customer progress: </label>
                <div className="progress">
                    <div className="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style={{width: progress}}>
                        <span className="sr-only">60% Complete</span>
                    </div>
                </div>
            </div>
        );
    }
});