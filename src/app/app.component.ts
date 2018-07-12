import { Component, OnInit} from '@angular/core';
import { Http } from '@angular/http';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'app';
  retorno: any = {};
  variaveis = environment;

  constructor(private http: Http) {
  }

  ngOnInit() {
    this.http.get('./variaveis.json')
      .subscribe(data => {

        this.retorno = data.json();

        environment.production = this.retorno.producao;
        environment.backend = this.retorno.backend;

      }, error => console.log(error));
  }

}
