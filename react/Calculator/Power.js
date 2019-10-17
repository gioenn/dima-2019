import {power} from './Calculator'
import React from 'react';

import { StyleSheet, Text, View, TextInput, Button } from 'react-native';


export default class Power extends React.Component {

  state = { textA: '0', textB: '0' }

  render() {
      return (
      <View style={styles.container}>
        <View style={[styles.container, {flexDirection: 'row'}]}>
          <TextInput
            style={styles.input}
            placeholder="0"
            onChangeText={(text) => { this.setState({textA: text}) } }
            />
          <Text>^</Text>
          <TextInput
            style={styles.input}
            placeholder="0"
            onChangeText={(text) => { this.setState({textB: text}) } }
            />
        </View>
        <Button title="compute" onPress={() => {
          let n = power(parseInt(this.state.textA), parseInt(this.state.textB));
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
