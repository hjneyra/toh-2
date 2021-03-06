import 'package:angular2/core.dart';

class Hero {
  final int id;
  String name;

  Hero(this.id, this.name);
}

final List<Hero> mockHeroes = [
  new Hero(11, 'Mr. Nice'),
  new Hero(12, 'Narco'),
  new Hero(13, 'Bombasto'),
  new Hero(14, 'Celeritas'),
  new Hero(15, 'Magneta'),
  new Hero(16, 'RubberMan'),
  new Hero(17, 'Dynama'),
  new Hero(18, 'Dr IQ'),
  new Hero(19, 'Magma'),
  new Hero(20, 'Tornado')
];

@Component(
    selector: 'my-app',
    template: '''
      <h1>{{title}}</h1>
      <h2>My Heroes</h2>
      <ul class="heroes">
        <li *ngFor="let hero of heroes"
          [class.selected]="hero == selectedHero"
          (click)="onSelect(hero)">
          <span class="badge">{{hero.id}}</span> {{hero.name}}
          <span style="float: right; margin: 5px;" (click)="remove(hero, \$event)">X</span>
        </li>
      </ul>
      <button (click)="addHero()">Add New</button>
      <div *ngIf="selectedHero != null">
        <h2>{{selectedHero.name}} details!</h2>
        <div><label>id: </label>{{selectedHero.id}}</div>
        <div>
          <label>name: </label>
          <input [(ngModel)]="selectedHero.name" placeholder="name"/>
        </div>
      </div>
    ''',
    styles: const [
      '''
      .selected {
        background-color: #CFD8DC !important;
        color: white;
      }
      .heroes {
        margin: 0 0 2em 0;
        list-style-type: none;
        padding: 0;
        width: 12em;
      }
      .heroes li {
        cursor: pointer;
        position: relative;
        left: 0;
        background-color: #EEE;
        margin: .5em;
        padding: .3em 0em;
        height: 1.6em;
        border-radius: 4px;
      }
      .heroes li.selected:hover {
        color: white;
      }
      .heroes li:hover {
        color: #607D8B;
        background-color: #EEE;
        left: .1em;
      }
      .heroes .text {
        position: relative;
        top: -3px;
      }
      .heroes .badge {
        display: inline-block;
        font-size: small;
        color: white;
        padding: 0.8em 0.7em 0em 0.7em;
        background-color: #607D8B;
        line-height: 1em;
        position: relative;
        left: -1px;
        top: -4px;
        height: 1.8em;
        margin-right: .8em;
        border-radius: 4px 0px 0px 4px;
      }
    '''
    ])
class AppComponent {
  final String title = 'Tour of Heroes';
  final List<Hero> heroes = mockHeroes;
  Hero selectedHero;

  onSelect(Hero hero) {
    selectedHero = hero;
  }

  remove(Hero hero, event) {
    heroes.remove(hero);
    selectedHero = null;
    event.stopPropagation();
  }

  addHero() {
    Hero hero = new Hero(heroes.length+100, "New Hero");
    heroes.add(hero);
    selectedHero = hero;
  }
}
