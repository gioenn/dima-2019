import {factorial} from './Calculator'
import React from 'react';

import { StyleSheet, Text, View, TextInput, Button } from 'react-native';


export default class Factorial extends React.Component {

  state = { text: '0' }

  render() {
      return (
      <View style={styles.container}>
        <View style={[styles.container, {flexDirection: 'row'}]}>
          <TextInput
            style={styles.input}
            placeholder="0"
            onChangeText={(text) => { this.setState({text: text}) } }
            />
          <Text>!</Text>
        </View>
        <Button title="compute" onPress={() => {
          let n = factorial(parseInt(this.state.text));
          this.props.updateResult(n);
        }} />
      </View> )
    }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    fontSize: 25,
    marginRight: 0,
    textAlign: 'right',
    color: 'black',
  }
});
