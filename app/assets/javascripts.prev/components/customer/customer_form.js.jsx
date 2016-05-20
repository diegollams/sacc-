var CustomerForm = React.createClass({
    // getDefaultProps: function () {
    //
    // },
    getInitialState: function () {
        this.MALE = 'male';
        this.FEMALE = 'female';
        this.MARRIED = 'married';
        this.SINGLE = 'single';
        this.UNKNOWN = '';
        var cleanProps = {};
        for(value in this.props.customer){
            if(this.props.customer[value] == null){
                cleanProps[value] = '';
            }else{
                cleanProps[value] = this.props.customer[value];
            }
        }
        cleanProps['errors'] = [];
        return  cleanProps;
    },
    //validate user first mididle and gender
    // validCustomer: function () {
    //     return this.state.first_name && this.state.middle_name && this.state.gender
    // },
    inputChange: function (name,value) {
        var inputValue = {};
        inputValue[name] = value;
        this.setState(inputValue);
    },
    controlChange: function (e) {
        var newInputValue = {};
        newInputValue[e.target.name] = e.target.value;
        this.setState(newInputValue);
    },
    handleUpdate: function () {
        $.ajax({
            url: '/customers/' + this.state.id,
            data: {customer: this.state},
            dataType: 'JSON',
            method: 'PATCH',
            success: function (data) {
                this.props.handleUpdate(data);
            }.bind(this),
            error: function (  XMLHttpRequest,  textStatus,  errorThrown) {
                if(errorThrown == 'Internal Server Error'){
                    this.setState({ errors: ['Internal Server Error']});
                    return;
                }
                this.setState({ errors: $.parseJSON(XMLHttpRequest.responseText)});
            }.bind(this)
        });
    },
    render: function () {
        var spouse_input = null;
        if(this.state.marital_status == this.MARRIED){
            spouse_input = <LabelInput name="spouse" label="Nombre del conyuge" onChange={this.inputChange} value={this.state.spouse}/>;
        }

        return (
            <div className="panel panel-default">
                <div className="panel-body">
                    <ErrorBox errorsArray={this.state.errors}/>
                    <div className="row">
                        <div className="col-sm-4">
                            <LabelInput name="first_name" label="Nombre" onChange={this.inputChange} value={this.state.first_name}/>
                        </div>
                        <div className="col-sm-4">
                            <LabelInput name="middle_name" label="Apellido Paterno" onChange={this.inputChange} value={this.state.middle_name}/>
                        </div>
                        <div className="col-sm-4">
                            <LabelInput name="last_name" label="Apellido materno" onChange={this.inputChange} value={this.state.last_name}/>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-4">
                            <LabelInput name="email" label="Email" onChange={this.inputChange} value={this.state.email} addon="@"/>
                        </div>
                        <div className="col-sm-4">
                            <label className="control-label">Genero</label>
                            <br/>
                            <label className="radio-inline">
                                <input type="radio" name="gender" value={this.MALE} checked={this.state.gender === this.MALE} onChange={this.controlChange} />
                                Masculino
                            </label>
                            <label className="radio-inline">
                                <input type="radio" name="gender" value={this.FEMALE} checked={this.state.gender === this.FEMALE} onChange={this.controlChange} />
                                Femenino
                            </label>
                        </div>
                        <div className="col-sm-4">
                            <LabelInput name="zipcode" label="Codigo postal" onChange={this.inputChange} value={this.state.zipcode} type="number"/>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-4">
                            <label className="control-label">Estado civil</label>
                            <br/>
                            <label className="radio-inline">
                                <input type="radio" name="marital_status" value={this.UNKNOWN} checked={this.state.marital_status === this.UNKNOWN} onChange={this.controlChange} />
                                Desconocido
                            </label>
                            <label className="radio-inline">
                                <input type="radio" name="marital_status" value={this.MARRIED} checked={this.state.marital_status === this.MARRIED} onChange={this.controlChange} />
                                Casado / Con pareja
                            </label>
                            <label className="radio-inline">
                                <input type="radio" name="marital_status" value={this.SINGLE} checked={this.state.marital_status === this.SINGLE} onChange={this.controlChange} />
                                Soltero
                            </label>
                        </div>
                        <div className="col-sm-8">
                            {spouse_input}
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-6">
                            <LabelInput name="main_phone" label="Telefono principal" onChange={this.inputChange} value={this.state.main_phone} type="number"/>
                        </div>
                        <div className="col-sm-6">
                            <LabelInput name="secondary_phone" label="Telefono secundario" onChange={this.inputChange} value={this.state.secondary_phone} type="number"/>
                        </div>
                    </div>
                </div>
                <div className="panel-footer">
                    <button className="btn btn-primary" onClick={this.handleUpdate}>Guardar</button>
                    <button className="btn btn-default" onClick={this.props.handleCancel}>Cancelar</button>
                </div>
            </div>
        );
    }
});