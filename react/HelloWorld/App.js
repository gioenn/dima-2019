import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';

class HelloWorld extends Component {
  render() {
    return (
      <Text style={styles.text}>Hello World!</Text>
    );
  }
}

class RepeatedHelloWorld extends Component {
  render() {
    let color = this.props.color ? { color: this.props.color } : styles.red;
    return (
      <Text style={[styles.text, color]}> Hello World {this.props.count} { this.props.count == 1 ? "time" : "times"} </Text>
    )
  }
}

function range(b, e) {
  let res = [];
  for (; b <= e; b++){
    res.push(b);
  }
  return res;
}

class HelloWorldGenerator extends Component {
  render() {
    let data = range(1, this.props.size);
    return (
      <View>
        {
          data.map((i) => {
            return <RepeatedHelloWorld color={ `rgb(${16*i % 255}, ${32*i % 255}, ${64 * i})` } key={i.toString()} count={i} />
          })
        }
      </View>
    )
  }
}

export default class App extends Component {
  render() {
    let x = 5;
    return (
      <View style={styles.container}>
        <HelloWorld />
        <HelloWorldGenerator size={10} />
        <RepeatedHelloWorld count={11} />
      </View>
    );
  }
}

const styles = StyleSheet.create(
  {
    container: {
      flex: 1,
      backgroundColor: 'white',
      alignItems: 'center',
      justifyContent: 'center',
    },
    text: {
      fontSize: 30,
      fontWeight: "500",
      color: "blue"
    },
    red: {
      color: "red"
    }

  }
);
