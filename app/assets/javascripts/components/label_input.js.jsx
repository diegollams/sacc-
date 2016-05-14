/**
 * create a input that sent to parent the value and the name of the input whenever it changes
 * Props:<ul>
 *     <li>type: {default: text}. input type use text or number
 *     <li>onChange: {function(name,input)}. function call whenever the input change and will return the name of the input and the value
 *     <li>name: {require}. the name to the input it will be use to identify the component
 *     <li>placeholder: placeholder of the input
 *     <li>disabled: whether the input can or cannot be edited
 *     <li>value: the initial value of the input
 *     <li>label: a message to be display as label
 *     <li>addon: a addon to be display a the left side of the input
 *
 */
var LabelInput = React.createClass({
    propTypes: {
        name: React.PropTypes.string.isRequired,
        type: React.PropTypes.string,
        onChange: React.PropTypes.func.isRequired,
        placeholder: React.PropTypes.string,
        disable: React.PropTypes.bool,
        value: React.PropTypes.string,
        label: React.PropTypes.string,
        addon: React.PropTypes.string,
    },
    getDefaultProps: function () {
     return {type: 'text',disable: false};
    },
    onChange: function (event) {
        this.props.onChange(event.target.name,event.target.value);
    },
    render: function () {
        var label = null,input,input_group = null;
        input = <input type={this.props.type} onChange={this.onChange} id={this.props.name} name={this.props.name} value={this.props.value} placeholder={this.props.placeholder} disabled={this.props.disabled} className="form-control" autoComplete="off"/>;
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