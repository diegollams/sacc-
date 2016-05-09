var CustomerInfo = React.createClass({
    getDefaultProps: function () {
      return {customer: {}};
    },

    render: function () {
        this.MR = 'Señor ';
        this.MS = 'Señorita ';
        this.MALE = 'male';
        var greeting = this.props.customer.gender === this.MALE ? this.MR : this.MS,email = null,spouse = null,register_date = null,main_phone = null,secondary_phone= null,zipcode = null;
        if(this.props.customer.email){
            email = <li className="list-group-item"> <span className="fa fa-envelope" data-toggle="tooltip" data-placement="bottom" title="Correo"/> {this.props.customer.email}</li>;
        }
        if(this.props.customer.register_date){
            register_date = <li className="list-group-item"><span className="fa fa-calendar" data-toggle="tooltip" data-placement="bottom" title="Fecha de registro"/> {this.props.customer.register_date}</li>;
        }
        if(this.props.customer.spouse){
            spouse = <li className="list-group-item"><span className="fa fa-bed" data-toggle="tooltip" data-placement="bottom" title="Nombre de pareja"/> {this.props.customer.spouse}</li>;
        }
        if(this.props.customer.main_phone){
            main_phone = <li className="list-group-item"><span className="fa fa-phone" data-toggle="tooltip" data-placement="bottom" title="Telefono principal"/> {this.props.customer.main_phone}</li>;

        }
        if(this.props.customer.secondary_phone){
            secondary_phone = <li className="list-group-item"><span className="fa fa-phone" data-toggle="tooltip" data-placement="bottom" title="Telefono secundario"/> {this.props.customer.secondary_phone}</li>;
        }
        if(this.props.customer.zipcode){
            zipcode = <li className="list-group-item"><span className="fa fa-globe" data-toggle="tooltip" data-placement="bottom" title="Codigo postal"/> {this.props.customer.zipcode}</li>;

        }
       return (
            <div className="panel panel-default">
                <div className="panel-body">
                    <ul className="list-group text-muted">
                       <li className="list-group-item"> <span className="fa fa-user" data-toggle="tooltip" data-placement="bottom" title="Nombre"/> {greeting + this.props.customer.first_name + ' ' + this.props.customer.middle_name + ' ' + this.props.customer.last_name}</li>
                       {email}
                       {register_date}
                       {spouse}
                       {main_phone}
                       {secondary_phone}
                       {zipcode}
                    </ul>
                </div>
                <div className="panel-footer">
                    <button className="btn btn-primary" onClick={this.props.editClick}>Editar</button>
                </div>
            </div>

       );
        //TODO add progress bar customer info added
    }
});