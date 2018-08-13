// Auto-generated. Do not edit!

// (in-package pr2_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PickPlaceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.test_scene_num = null;
      this.object_name = null;
      this.arm_name = null;
      this.pick_pose = null;
      this.place_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('test_scene_num')) {
        this.test_scene_num = initObj.test_scene_num
      }
      else {
        this.test_scene_num = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('object_name')) {
        this.object_name = initObj.object_name
      }
      else {
        this.object_name = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('arm_name')) {
        this.arm_name = initObj.arm_name
      }
      else {
        this.arm_name = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('pick_pose')) {
        this.pick_pose = initObj.pick_pose
      }
      else {
        this.pick_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('place_pose')) {
        this.place_pose = initObj.place_pose
      }
      else {
        this.place_pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PickPlaceRequest
    // Serialize message field [test_scene_num]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.test_scene_num, buffer, bufferOffset);
    // Serialize message field [object_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.object_name, buffer, bufferOffset);
    // Serialize message field [arm_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.arm_name, buffer, bufferOffset);
    // Serialize message field [pick_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pick_pose, buffer, bufferOffset);
    // Serialize message field [place_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.place_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PickPlaceRequest
    let len;
    let data = new PickPlaceRequest(null);
    // Deserialize message field [test_scene_num]
    data.test_scene_num = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [object_name]
    data.object_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [arm_name]
    data.arm_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [pick_pose]
    data.pick_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [place_pose]
    data.place_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.object_name);
    length += std_msgs.msg.String.getMessageSize(object.arm_name);
    return length + 116;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_robot/PickPlaceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1c37746ef6af94d99dcfe2dd193260b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    std_msgs/Int32 test_scene_num
    std_msgs/String object_name
    std_msgs/String arm_name
    geometry_msgs/Pose pick_pose
    geometry_msgs/Pose place_pose
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PickPlaceRequest(null);
    if (msg.test_scene_num !== undefined) {
      resolved.test_scene_num = std_msgs.msg.Int32.Resolve(msg.test_scene_num)
    }
    else {
      resolved.test_scene_num = new std_msgs.msg.Int32()
    }

    if (msg.object_name !== undefined) {
      resolved.object_name = std_msgs.msg.String.Resolve(msg.object_name)
    }
    else {
      resolved.object_name = new std_msgs.msg.String()
    }

    if (msg.arm_name !== undefined) {
      resolved.arm_name = std_msgs.msg.String.Resolve(msg.arm_name)
    }
    else {
      resolved.arm_name = new std_msgs.msg.String()
    }

    if (msg.pick_pose !== undefined) {
      resolved.pick_pose = geometry_msgs.msg.Pose.Resolve(msg.pick_pose)
    }
    else {
      resolved.pick_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.place_pose !== undefined) {
      resolved.place_pose = geometry_msgs.msg.Pose.Resolve(msg.place_pose)
    }
    else {
      resolved.place_pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

class PickPlaceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PickPlaceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PickPlaceResponse
    let len;
    let data = new PickPlaceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_robot/PickPlaceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PickPlaceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PickPlaceRequest,
  Response: PickPlaceResponse,
  md5sum() { return '803571dc87b1116273df703ec8a12b59'; },
  datatype() { return 'pr2_robot/PickPlace'; }
};
