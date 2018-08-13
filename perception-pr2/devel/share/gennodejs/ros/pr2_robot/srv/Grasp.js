// Auto-generated. Do not edit!

// (in-package pr2_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GraspRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_name = null;
      this.test_scene_num = null;
    }
    else {
      if (initObj.hasOwnProperty('object_name')) {
        this.object_name = initObj.object_name
      }
      else {
        this.object_name = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('test_scene_num')) {
        this.test_scene_num = initObj.test_scene_num
      }
      else {
        this.test_scene_num = new std_msgs.msg.Int32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspRequest
    // Serialize message field [object_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.object_name, buffer, bufferOffset);
    // Serialize message field [test_scene_num]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.test_scene_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspRequest
    let len;
    let data = new GraspRequest(null);
    // Deserialize message field [object_name]
    data.object_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [test_scene_num]
    data.test_scene_num = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.object_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_robot/GraspRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '458f028c2a9a12053f64932c127d35f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    std_msgs/String object_name
    std_msgs/Int32 test_scene_num
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraspRequest(null);
    if (msg.object_name !== undefined) {
      resolved.object_name = std_msgs.msg.String.Resolve(msg.object_name)
    }
    else {
      resolved.object_name = new std_msgs.msg.String()
    }

    if (msg.test_scene_num !== undefined) {
      resolved.test_scene_num = std_msgs.msg.Int32.Resolve(msg.test_scene_num)
    }
    else {
      resolved.test_scene_num = new std_msgs.msg.Int32()
    }

    return resolved;
    }
};

class GraspResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grasp_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('grasp_pose')) {
        this.grasp_pose = initObj.grasp_pose
      }
      else {
        this.grasp_pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspResponse
    // Serialize message field [grasp_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.grasp_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspResponse
    let len;
    let data = new GraspResponse(null);
    // Deserialize message field [grasp_pose]
    data.grasp_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_robot/GraspResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '306dcb5b004c7872f94310686b0d0609';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    geometry_msgs/Pose grasp_pose
    
    
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
    const resolved = new GraspResponse(null);
    if (msg.grasp_pose !== undefined) {
      resolved.grasp_pose = geometry_msgs.msg.Pose.Resolve(msg.grasp_pose)
    }
    else {
      resolved.grasp_pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

module.exports = {
  Request: GraspRequest,
  Response: GraspResponse,
  md5sum() { return '982194e190e8ba0c9866716771b038e9'; },
  datatype() { return 'pr2_robot/Grasp'; }
};
