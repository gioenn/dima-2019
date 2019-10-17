import React from 'react';
import { StyleSheet, Text, View, TextInput, Button } from 'react-native';
import Factorial from './Factorial';
import Power from './Power';

export default class App extends React.Component {

  state = {result: 0}

  render() {
    return (
      <View style={[styles.container, {marginTop: 50}]}>
        <Text style={styles.result}> {this.state.result} </Text>
        <View style={[styles.container]}>
          <Factorial updateResult={(result) => {
            this.setState({result: result})
          }} />
          <Power updateResult={(result) => {
            this.setState({result: result})
          }} />
        </View>
      </View>
    );
  }
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    fontSize: 50
  },
  result: {
    fontSize: 50,
    color: 'red'
  }
});
