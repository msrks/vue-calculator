<template>
  <div id="app" class="container">
    <img src="./assets/logo.png">
    <h1> Useless Calculator </h1>
    <h2> {{ total == 0 ? "" : total }} {{ prevOps }} {{ display }}</h2>
    <div >
      <button @click="enterOps('/')">/</button>
      <button @click="enterNum(7)">7</button>
      <button @click="enterNum(8)">8</button>
      <button @click="enterNum(9)">9</button>
    </div>
    <div >
      <button @click="enterOps('*')">*</button>
      <button @click="enterNum(4)">4</button>
      <button @click="enterNum(5)">5</button>
      <button @click="enterNum(6)">6</button>
    </div>
    <div >
      <button @click="enterOps('+')">+</button>
      <button @click="enterNum(1)">1</button>
      <button @click="enterNum(2)">2</button>
      <button @click="enterNum(3)">3</button>
    </div>   
    <div >
      <button @click="enterOps('-')">-</button>
      <button @click="enterNum(0)">0</button>
      <button @click="clear">C</button>
      <button @click="enterOps('=')">=</button>
    </div>
    <p><a href="https://github.com/msrks/vue-calculator">[view source on github]</a></p>
    <hr>
    <footer>
      <p>&copy Copyright 2018 <a href="http://msrks.github.io">@msrks</a></p>
    </footer>                    
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      currentNum: 0,
      total: 0,
      display: "",
      prevOps: "",
    }
  },
  methods: {
    clear () {
      this.currentNum = 0;
      this.total = 0;
      this.display = "";
      this.prevOps = "";
    },
    enterNum (val) {
      if (this.currentNum == 0) {
        this.currentNum = val;
        this.display = val.toString();
      } else {
        this.currentNum = this.currentNum * 10 + val;
        this.display += val.toString();
      }
    },
    enterOps (ops) {
      if (this.total == 0 && this.currentNum == 0) {
        return;
      }
      switch (this.prevOps) {
        case "":
        case "+":
          this.total += this.currentNum;
          break;
        case "-":
          this.total -= this.currentNum;
          break;
        case "*":
          this.total *= this.currentNum;
          break;
        case "/":
          this.total /= this.currentNum;
          break;          
      }
      this.currentNum = 0;
      if (ops == "=") {
        this.display = this.total.toString();
        this.total = 0;
        this.prevOps = "";
        return;
      }
      this.display = "";
      this.prevOps = ops;
    },
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

button {
  margin: 0px;
  padding: 0px;
  width: 40px;
  font-size: 1.3em;
}
</style>
