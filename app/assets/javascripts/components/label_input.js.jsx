var LabelInput = React.createClass({
    getDefaultProps: function () {
     return {type: 'text',onChange: function(){console.log("Warning change function not added LabelInput")}};
    },
    onChange: function (event) {
        this.props.onChange(event.target.name,event.target.value);
    },
    // propTypes: function () {
    //    
    // }
    render: function () {
        var label = null,input,input_group = null;
        input = <input type={this.props.type} onChange={this.onChange} id={this.props.name} name={this.props.name} value={this.props.value} placeholder={this.props.placeholder} disabled={this.props.disabled} className="form-control"/>;
        if(this.props.label){
            label = <label className="control-label">{this.props.label}</label>
        }
        if(this.props.addon){
            input_group = <div className="input-group">
                <span className="input-group-addon">{this.props.addon}</span>
                {input}
            </div>;
        }else{
            input_group = input;
        }
        return (
            <div className="form-group">
                {label}
                {input_group}
            </div>
        );

    }
});